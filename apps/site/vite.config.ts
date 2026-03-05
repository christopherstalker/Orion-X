import { defineConfig, loadEnv } from 'vite';
import react from '@vitejs/plugin-react';

export default defineConfig(({ mode }) => {
  const loaded = loadEnv(mode, process.cwd(), '');
  const orionApiKey = loaded.ORION_API_KEY ?? process.env.ORION_API_KEY ?? '';

  return {
    plugins: [react()],
    define: {
      'import.meta.env.ORION_API_KEY': JSON.stringify(orionApiKey)
    },
    server: {
      host: '0.0.0.0',
      port: 5173
    }
  };
});
