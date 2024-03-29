import React, { useState, Fragment } from "react";
import { useMutation } from "react-apollo";
import { NEW_GAME } from "./apollo";
import Instructions from "./Instructions";
import "../styles/GameButton.scss";

function NewGameButton() {
  const [errors, setErrors] = useState([]);

  const handleFormSubmit = (props) => {
    let { newGame } = props;
    newGame()
      .then((response) => {
        alert("New game created! Invite other horrible people to get started.");
        window.location.reload(false);
      })
      .catch((e) => {
        // let messages = JSON.parse(e.graphQLErrors[0].message);
        // setErrors(messages.errors);
      });
  };

  const [newGame] = useMutation(NEW_GAME);
  return (
    <Fragment>
      <div className="GameButton">
        <form
          onSubmit={(e) => {
            e.preventDefault();
            handleFormSubmit({ newGame });
          }}
        >
          <button type="submit">Start a new game.</button>
        </form>
      </div>
      <Instructions />
    </Fragment>
  );
}

const Errors = ({ errors }) => {
  const errorsList = errors.map((error, index) => <li key={index}>{error}</li>);

  return <ul>{errorsList}</ul>;
};

export default NewGameButton;
