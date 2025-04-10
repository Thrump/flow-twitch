import { open } from "https://deno.land/x/open/index.ts";
import { Flow, JSONRPCResponse } from "npm:flow-launcher-helper@2.2.0";

const { showResult, on, run } = new Flow();

on("query", (params) => {
  return showResult({
    title: "Launch Twitch User",
    subtitle: `https://www.twitch.tv/${params[0]}`,
    params: [params[0]],
    method: "twitchLaunch",
    iconPath: "./public/app.png",
  });
});

on("twitchLaunch", (params) => {
  const url = `https://www.twitch.tv/${params[0]}`;
  open(url);
});

run();
