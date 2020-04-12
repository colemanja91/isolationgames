import React from "react";
import List from "@material-ui/core/List";
import ListItem from "@material-ui/core/ListItem";
import Divider from "@material-ui/core/Divider";
import SidebarActions from "./SidebarActions";
import SidebarPlayerList from "./SidebarPlayerList";
import SidebarUser from "./SidebarUser";
import VideoLink from "./VideoLink";
import "../styles/Sidebar.scss";

function Sidebar({ game, user }) {
  const { enoughPlayers, isOwner, status, videoLink } = game;

  return (
    <div className="sidebar">
      <List disablePadding dense>
        <SidebarUser user={user} />
        <Divider style={{ margin: "12px 0" }} />
        <SidebarPlayerList game={game} />
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
