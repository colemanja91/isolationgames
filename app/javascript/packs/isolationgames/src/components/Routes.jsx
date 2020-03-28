import React from "react";
import { Route, Switch } from "react-router-dom";
import About from "./About";
import JoinGame from "./JoinGame";
import Home from "./Home";
import HowToPlay from "./HowToPlay";

function Routes() {
  return (
    <Switch>
      <Route path="/about">
        <About />
      </Route>
      <Route path="/how-to-play">
        <HowToPlay />
      </Route>
      <Route path="/joinGame" component={JoinGame} />
      <Route path="/" width="100%" component={Home} />
    </Switch>
  );
}

export default Routes;
