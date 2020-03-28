import React, { Fragment } from "react";
import { Link } from "react-router-dom";
import { useQuery } from "react-apollo";
import { GAME } from "../../apollo";
import Game from "./Game";
import NewGameButton from "./NewGameButton";
import "../../assets/stylesheets/components/Home.scss";
import "../../assets/stylesheets/components/GameButton.scss";

function Home() {
  const { loading, error, data } = useQuery(GAME);

  if (loading) return <div></div>;

  return (
    <div className="Home">
      {!error && data ? (
        <Game data={data} />
      ) : (
        <Fragment>
          <NewGameButton />
          <Link to="/joinGame" className="GameButton">
            <button type="button">Join existing game.</button>
          </Link>
        </Fragment>
      )}
    </div>
  );
}

export default Home;
