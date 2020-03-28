import React from "react";
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
      {!error && data.game ? <Game data={data} /> : <NewGameButton />}
    </div>
  );
}

export default Home;
