import React, { useState } from "react";
import Slide from "@material-ui/core/Slide";
import "../../assets/stylesheets/components/Card.scss";

function Card({ text, cardType, disabled, onClick, isWinner }) {
  const [border, setBorder] = useState("3px solid black");
  const [selected, setSelected] = useState(false);

  const getBorder = () => {
    return isWinner ? "6px solid red" : border;
  };

  const clickAction = () => {
    disabled ? null : handleClick();
  };

  const handleClick = () => {
    {
      !selected ? setBorder("6px solid blue") : setBorder("3px solid black");
    }
    setSelected(!selected);
    onClick();
  };

  return (
    <Slide direction="up" in={true} timeout={750} mountOnEnter unmountOnExit>
      <div
        className={cardType}
        dangerouslySetInnerHTML={{ __html: text }}
        style={{ border: getBorder() }}
        onClick={clickAction}
      ></div>
    </Slide>
  );
}

export default Card;
