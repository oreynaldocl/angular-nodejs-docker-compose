const express = require('express');
const app = express(),
      bodyParser = require("body-parser");
      port = 3080;

const users = [];

app.use(bodyParser.json());
app.use(express.static(process.cwd()+"/my-app/dist/angular-nodejs-docker-compose/"));

// Cross Origin middleware, only add if required
// app.use(function(_, res, next) {
//   res.header("Access-Control-Allow-Origin", "*")
//   res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept")
//   next()
// });


app.get('/api/users', (_, res) => {
  console.log('users listed')
  res.json(users);
});

app.post('/api/user', (req, res) => {
  console.log('user to add', req && req.body && req.body.user)
  const user = req.body.user;
  users.push(user);
  res.json("user addedd");
});

app.get('/', (_,res) => {
  // redirected
  res.sendFile(process.cwd()+"/app-ui/dist/angular-nodejs-docker-compose/index.html")
});

app.listen(port, () => {
    console.log(`Server listening on the port::${port}`);
});
