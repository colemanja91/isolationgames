import React from "react";
import { useQuery } from "react-apollo";
import { GAME } from "../../apollo";

function Game({ id }) {
  const { loading, error, data } = useQuery(GAME, { variables: { id } });
  if (loading) return <div></div>;
  const { isOwner, name, players, startedAt, status, videoLink } = data.game;
  return (
    <div>
      {name}
      {status}
    </div>
  );
}

export default Game;
