import React from "react";
import List from "@material-ui/core/List";
import ListItem from "@material-ui/core/ListItem";
import Divider from "@material-ui/core/Divider";
import SidebarActions from "./SidebarActions";
import SidebarPlayerList from "./SidebarPlayerList";
import SidebarUser from "./SidebarUser";
import VideoLink from "./VideoLink";
import "../../assets/stylesheets/components/Sidebar.scss";

function Sidebar({ gameData, userData }) {
  const {
    enoughPlayers,
    isOwner,
    name,
    players,
    status,
    videoLink
  } = gameData.game;

  return (
    <div className="sidebar">
      <List disablePadding dense>
        <SidebarUser user={userData.user} />
        <Divider style={{ margin: "12px 0" }} />
        <SidebarPlayerList players={players} name={name} />
        <Divider style={{ margin: "12px 0" }} />
        <ListItem className="sidebar-item">
          <VideoLink isOwner={isOwner} videoLink={videoLink} />
        </ListItem>
        <Divider style={{ margin: "12px 0" }} />
        <SidebarActions
          isOwner={isOwner}
          status={status}
          enoughPlayers={enoughPlayers}
        />
      </List>
    </div>
  );
}

export default Sidebar;
