export default async function handler(req, res) {
  // Allow CORS from any origin
  res.setHeader('Access-Control-Allow-Credentials', true);
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'GET,OPTIONS,PATCH,DELETE,POST,PUT');
  res.setHeader(
    'Access-Control-Allow-Headers',
    'X-CSRF-Token, X-Requested-With, Accept, Accept-Version, Content-Length, Content-MD5, Content-Type, Date, X-Api-Version'
  );

  if (req.method === 'OPTIONS') {
    res.status(200).end();
    return;
  }

  // Extract 'path' from query to determine the Steam API endpoint
  // Example: /api/proxy?path=ISteamNews/GetNewsForApp/v2&appid=123
  const { path, connection, ...query } = req.query;

  // Default to GetNumberOfCurrentPlayers if no path is provided (backward compatibility)
  const apiPath = path || 'ISteamUserStats/GetNumberOfCurrentPlayers/v1';

  const queryString = new URLSearchParams(query).toString();
  const targetUrl = `https://api.steampowered.com/${apiPath}/?${queryString}`;

  try {
    const response = await fetch(targetUrl);
    if (!response.ok) {
      throw new Error(`Steam API rejected request: ${response.statusText}`);
    }
    const data = await response.json();
    res.status(200).json(data);
  } catch (error) {
    res.status(500).json({ error: 'Failed to fetch data from Steam' });
  }
}
