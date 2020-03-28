import React from "react";
import { Route, Switch } from "react-router-dom";
import About from "./About";
import Game from "./Game";
import JoinGame from "./JoinGame";
import Home from "./Home";

function Routes() {
  return (
    <Switch>
      <Route path="/about">
        <About />
      </Route>
      <Route path="/joinGame" component={JoinGame} />
      <Route path="/game/:id" component={Game} />
      <Route path="/" width="100%" component={Home} />
    </Switch>
  );
}

export default Routes;
