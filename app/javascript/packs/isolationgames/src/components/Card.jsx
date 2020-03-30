import React from "react";
import "../../assets/stylesheets/components/Card.scss";

function Card({ cardId, text, cardType }) {
  return (
    <div className={cardType} dangerouslySetInnerHTML={{ __html: text }}></div>
  );
}

export default Card;