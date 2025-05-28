/// <reference types="vite/client" />

declare module './contentful.js' {
  const client: any;
  export default client;
}

declare module './contentful' {
  const client: any;
  export default client;
}
