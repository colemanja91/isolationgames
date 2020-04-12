import React from "react";
import { useQuery } from "react-apollo";
import { GAME, USER } from "./apollo";
import Game from "./Game";
import NewGameButton from "./NewGameButton";
import "../styles/Home.scss";
import "../styles/GameButton.scss";

function Home() {
  const { loading: gameLoading, error: gameError, data: gameData } = useQuery(
    GAME,
    {
      pollInterval: 5000,
    }
  );
  const { loading: userLoading, error: userError, data: userData } = useQuery(
    USER
  );

  if (gameLoading || userLoading) return <div></div>;
  if (gameError || userError) return <div></div>;

  return (
    <div className="Home">
      {gameData.game ? (
        <Game game={gameData.game} user={userData.user} />
      ) : (
        <NewGameButton />
      )}
    </div>
  );
}

export default Home;
