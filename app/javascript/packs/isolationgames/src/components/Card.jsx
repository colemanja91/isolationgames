import React, { useState } from "react";
import Chip from "@material-ui/core/Chip";
import "../../assets/stylesheets/components/Card.scss";

function Card({ text, cardType, disabled, onClick, isWinner }) {
  const [border, setBorder] = useState("3px solid black");
  const [selected, setSelected] = useState(false);

  const getBorder = () => {
    return isWinner ? "6px solid red" : border;
  };

  const clickAction = () => {
    return disabled ? null : handleClick;
  };

  const handleClick = () => {
    {
      !selected ? setBorder("6px solid blue") : setBorder("3px solid black");
    }
    setSelected(!selected);
    onClick();
  };

  return (
    <div
      className={cardType}
      dangerouslySetInnerHTML={{ __html: text }}
      style={{ border: getBorder() }}
      onClick={clickAction}
    ></div>
  );
}

export default Card;
