var app = require('http').createServer(handler)
  , io = require('socket.io').listen(app)
  , redis = require('redis')
  , url = require('url');

app.listen(process.env.PORT || 5001);

function handler(req, res) {}

io.configure(function () { 
  io.set("transports", ["xhr-polling"]); 
  io.set("polling duration", 10); 
});

var connectToRedis = function() {
  var redisUrlString = process.env.REDISTOGO_URL || "redis://localhost:6379";
  var redisUrl = url.parse(redisUrlString);
  client = redis.createClient(redisUrl.port, redisUrl.hostname);
  if (redisUrl.auth) {
    client.auth(redisUrl.auth.split(":")[1]);
  }

  client.on('error', function(error) {
    console.log("redis error");
    console.log(error);
  });

  return client;
}

var client = connectToRedis();
client.on("subscribe", function(channel, count) {
  console.log("Subscribed to channel: " + channel + " with count: " + count);
})

client.on("message", function(channel, message) {
  io.sockets.emit(channel, message);
});

client.subscribe("hawala:userCreated", "hawala:paymentCreated");