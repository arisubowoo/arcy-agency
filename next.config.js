/** @type {import('next').NextConfig} */
const nextConfig = {
  reactStrictMode: true,
  // Ensure pages directory is detected
  pageExtensions: ["tsx", "ts", "jsx", "js"],
};

module.exports = nextConfig;
