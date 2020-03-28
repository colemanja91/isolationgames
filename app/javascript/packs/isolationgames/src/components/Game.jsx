import React from "react";
import Sidebar from "./Sidebar";

function Game({ gameData, userData }) {
  return <Sidebar gameData={gameData} userData={userData} />;
}

export default Game;
