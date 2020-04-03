import React, { useState } from "react";
import { useHistory, useParams } from "react-router-dom";
import { useMutation } from "react-apollo";
import { JOIN_GAME } from "../../apollo";

function JoinGame() {
  let { name } = useParams();
  let history = useHistory();

  const [join, { loading, error }] = useMutation(JOIN_GAME, {
    onCompleted() {
      history.push("/");
    }
  });

  if (loading) return <p>loading...</p>;
  if (error) return <p>An error occurred</p>;

  return (
    <div>
      {join({
        variables: { gameName: name }
      })}
    </div>
  );
}

export default JoinGame;
