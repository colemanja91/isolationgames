import React from "react";

function Sidebar({ data }) {
  const { isOwner, name, players, startedAt, status, videoLink } = data.game;

  return (
    <div className="sidebar">
      {console.log(players)}
      {name}
      <br></br>
      {status}
      <br></br>
      {videoLink}
      <br></br>
    </div>
  );
}

export default Sidebar;
