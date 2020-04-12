import React from "react";
import ReactDOM from "react-dom";
import { BrowserRouter } from "react-router-dom";
import About from "../components/About";
import "../styles/App.scss";

document.addEventListener("DOMContentLoaded", () => {
  ReactDOM.render(
    <BrowserRouter>
      <About />
    </BrowserRouter>,
    document.querySelector("#app")
  );
});
