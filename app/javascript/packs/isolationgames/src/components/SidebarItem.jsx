import React from "react";

function SidebarItem({ data }) {
  const { isOwner, name, players, startedAt, status, videoLink } = data.game;

  return (
    <div className="sidebar-item">
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

export default SidebarItem;
