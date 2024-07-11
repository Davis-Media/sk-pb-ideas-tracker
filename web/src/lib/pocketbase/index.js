import PocketBase from 'pocketbase';

const url = import.meta.env.PROD ? import.meta.env.VITE_PROD_PB_URL : "http://localhost:8090"

export const pb = new PocketBase(url);
