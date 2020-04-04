import React from "react";
import { Route, Switch } from "react-router-dom";
import About from "./About";
import JoinGame from "./JoinGame";
import Home from "./Home";
import HowToPlay from "./HowToPlay";
import NotFound from "./NotFound";

function Routes() {
  return (
    <Switch>
      <Route exact path="/about">
        <About />
      </Route>
      <Route exact path="/how-to-play">
        <HowToPlay />
      </Route>
      <Route exact path="/join/:name" component={JoinGame} />
      <Route exact path="/" width="100%" component={Home} />
      <Route component={NotFound} />
    </Switch>
  );
}

export default Routes;
