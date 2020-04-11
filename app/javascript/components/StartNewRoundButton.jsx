import React from "react";
import { useMutation } from "react-apollo";
import { NEW_ROUND } from "./apollo";
import Button from "@material-ui/core/Button";

function StartNewRoundButton() {
  const [newRound, { loading, error }] = useMutation(NEW_ROUND, {
    onCompleted() {
      handleClose();
    },
    refetchQueries: ["Game"],
  });

  const submit = () => {
    newRound();
  };

  return (
    <div>
      <Button variant="outlined" color="secondary" onClick={submit}>
        Start new round
      </Button>
    </div>
  );
}

export default StartNewRoundButton;
