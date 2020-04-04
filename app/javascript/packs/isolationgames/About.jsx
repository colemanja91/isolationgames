import React from "react";
import ReactDOM from "react-dom";
import About from "./src/components/About";
import "./assets/stylesheets/App.scss";

function App() {
  return <About />;
}

document.addEventListener("DOMContentLoaded", () => {
  ReactDOM.render(<App />, document.querySelector("#app"));
});
