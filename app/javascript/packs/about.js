require("@rails/ujs").start();
require("turbolinks").start();
require("@rails/activestorage").start();
require("channels");

import React from "react";
import ReactDOM from "react-dom";
import { BrowserRouter } from "react-router-dom";
import About from "../components/About";

document.addEventListener("DOMContentLoaded", () => {
  ReactDOM.render(
    <BrowserRouter>
      <About />
    </BrowserRouter>,
    document.querySelector("#app")
  );
});
