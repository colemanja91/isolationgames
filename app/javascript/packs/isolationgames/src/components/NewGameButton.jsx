import React, { useState } from "react";
import { useMutation } from "react-apollo";
import { NEW_GAME } from "../../apollo";
import "../../assets/stylesheets/components/GameButton.scss";

function NewGameButton() {
  const [errors, setErrors] = useState([]);

  const handleFormSubmit = props => {
    let { newGame } = props;
    newGame()
      .then(response => {
        alert("New game created! Invite other horrible people to get started.");
        window.location.reload(false);
      })
      .catch(e => {
        // let messages = JSON.parse(e.graphQLErrors[0].message);
        // setErrors(messages.errors);
      });
  };

  const [newGame] = useMutation(NEW_GAME);
  return (
    <div className="GameButton">
      <Errors errors={errors} />
      <form
        onSubmit={e => {
          e.preventDefault();
          handleFormSubmit({ newGame });
        }}
      >
        <button type="submit">Start a new game.</button>
      </form>
    </div>
  );
}

const Errors = ({ errors }) => {
  const errorsList = errors.map((error, index) => <li key={index}>{error}</li>);

  return <ul>{errorsList}</ul>;
};

export default NewGameButton;
