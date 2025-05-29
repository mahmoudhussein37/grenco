import { createClient } from "contentful";

const spaceId = import.meta.env.VITE_CONTENTFUL_SPACE_ID || "g8e8ffg6jo04";
const accessToken =
  import.meta.env.VITE_CONTENTFUL_ACCESS_TOKEN ||
  "YBepEoTgpTm0KSlSF9QCN1ub0_G-qTB04NlJktUJuVE";

const client = createClient({
  space: spaceId,
  accessToken: accessToken,
  environment: "master",
});

export default client;
