import React, { Component } from "react";
import ReactDOM from "react-dom";
import { BrowserRouter } from "react-router-dom";
import { ApolloProvider } from "react-apollo";
import { client } from "./apollo";
import NavBar from "./src/components/NavBar";
import Routes from "./src/components/Routes";
import "./assets/stylesheets/App.scss";

function App() {
  return (
    <ApolloProvider client={client} className="foo">
      <NavBar />
      <Routes />
    </ApolloProvider>
  );
}

document.addEventListener("DOMContentLoaded", () => {
  ReactDOM.render(
    <BrowserRouter>
      <App />
    </BrowserRouter>,
    document.querySelector("#app")
  );
});
