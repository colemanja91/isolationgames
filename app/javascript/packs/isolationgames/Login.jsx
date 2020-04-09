import React from "react";
import ReactDOM from "react-dom";
import Login from "./src/components/Login";
import "./assets/stylesheets/App.scss";

function App() {
  return <Login />;
}

document.addEventListener("DOMContentLoaded", () => {
  ReactDOM.render(<App />, document.querySelector("#app"));
});
