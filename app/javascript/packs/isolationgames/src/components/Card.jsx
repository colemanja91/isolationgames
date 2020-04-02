import React, { useState } from "react";
import "../../assets/stylesheets/components/Card.scss";

function Card({ text, cardType, onClick }) {
  const [border, setBorder] = useState("3px solid black");
  const [selected, setSelected] = useState(false);

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
      style={{ border: border }}
      onClick={handleClick}
    ></div>
  );
}

export default Card;
