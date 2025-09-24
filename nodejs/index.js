// index.js
const grpc = require('@grpc/grpc-js');
const protoLoader = require('@grpc/proto-loader');
const path = require('path');

// // Load proto
const protoPath = path.join(__dirname, '../protos/remote_todo.proto');
const packageDef = protoLoader.loadSync(protoPath, {
  keepCase: true,
  longs: String,
  enums: String,
  defaults: true,
  oneofs: true,
});
const grpcObj = grpc.loadPackageDefinition(packageDef);
// const todoPackage = grpcObj.todoPackage;
const todoPackage = grpcObj.mnm;

// In-memory task storage
let tasks = [];
let subscribers = [];

// Server-side streaming RPC: FetchFromOwnServer
function fetchFromOwnServer(call) {
  // Add the subscriber
  subscribers.push(call);

  // Remove when client disconnects
  call.on('cancelled', () => {
    subscribers = subscribers.filter(c => c !== call);
  });

  // Optional: send current tasks immediately
  tasks.forEach(task => call.write(task));
}

// Normal RPC to add a task
function addTask(call, callback) {
  const newTask = {
    id: tasks.length + 1,
    title: call.request.title || `Task ${tasks.length + 1}`,
    completed: false,
  };

  tasks.push(newTask);

  // Push update to all subscribers (streaming clients)
  subscribers.forEach(sub => sub.write(newTask));

  callback(null, newTask);
}

// Normal RPC to list all tasks
function listTasks(call, callback) {
  callback(null, { tasks });
}

// Create gRPC server
const server = new grpc.Server();
server.addService(todoPackage.RemoteTasksService.service, {
  FetchFromOwnServer: fetchFromOwnServer,
  AddTask: addTask,
  ListTasks: listTasks,
});

// // Start server on the same port as daemon
const PORT = 50052;
server.bindAsync(
  `0.0.0.0:${PORT}`,
  grpc.ServerCredentials.createInsecure(),
  (err, port) => {
    if (err) {
      console.error('Error starting gRPC server:', err);
      return;
    }
    console.log(`✅ gRPC server running on port ${port}`);
    server.start();
  }
);

// // Example: automatically add a task every 10 seconds
setInterval(() => {
  const task = { id: tasks.length + 1, title: `Auto Task ${tasks.length + 1}`, completed: false };
  tasks.push(task);
  subscribers.forEach(sub => sub.write(task));
  console.log('🔄 Sent new task to subscribers:', task);
}, 10000);
