import type { NextConfig } from "next";

const config: NextConfig = {
  output: "standalone",  // REQUIRED for Coolify Dockerfile deployment
  images: { remotePatterns: [{ hostname: "*.backblazeb2.com" }] },
};

export default config;
