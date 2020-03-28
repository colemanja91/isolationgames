import React, { useState, Fragment } from "react";
import { Link } from "react-router-dom";
import Game from "./Game";
import NewGameButton from "./NewGameButton";
import "../../assets/stylesheets/components/Home.scss";
import "../../assets/stylesheets/components/GameButton.scss";

function Home() {
  const [currentGameId, setCurrentGameId] = useState();
  return (
    <div className="Home">
      {currentGameId ? (
        <Game id={currentGameId} />
      ) : (
        <Fragment>
          <NewGameButton setCurrentGameId={setCurrentGameId} />
          <Link to="/joinGame" className="GameButton">
            <button type="button">Join existing game.</button>
          </Link>
        </Fragment>
      )}
    </div>
  );
}

export default Home;
