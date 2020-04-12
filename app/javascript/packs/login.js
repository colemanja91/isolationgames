import React from "react";
import ReactDOM from "react-dom";
import { BrowserRouter } from "react-router-dom";
import Login from "../components/Login";
import "../styles/App.scss";

document.addEventListener("DOMContentLoaded", () => {
  ReactDOM.render(
    <BrowserRouter>
      <Login />
    </BrowserRouter>,
    document.querySelector("#app")
  );
});
