import index from './index.html'
import express from 'express';
import bcrypt from 'bcryptjs';
import jwt from 'jsonwebtoken';
import bodyParser from 'body-parser';

const app = express!
app.use bodyParser.json!

const users = [];

const JWT_SECRET = 'your_jwt_secret_here';

app.post '/register', do(req, res)
	const { username, password } = req.body;
	if not username or not password
		return res.status(400).json({ error: 'Username and password are required.' });


	// Check if user exists
	const userExists = users.find(do(user) user.username === username);
	if userExists
		return res.status(409).json({ error: 'User already exists.' });

	// Hash the password
	const hashedPassword = await bcrypt.hash(password, 10);

	// Save user to "database"
	users.push({ username, password: hashedPassword });

	res.status(201).json({ message: 'User registered successfully.' });

// User login route
app.post '/login', do(req, res)
	const { username, password } = req.body;
	if not username || not password
		return (res.status 400).json { error: 'Username and password are required.' }

	// Find user
	const user = users.find(do(user) user.username === username);
	if not user
		return (res.status 404).json {error: 'User not found.'}

	// Compare password
	const isMatch = await bcrypt.compare(password, user.password);
	if not isMatch
		return (res.status 401).json { error: 'Invalid credentials.'}

	// Generate token
	const token = jwt.sign({ username }, JWT_SECRET, { expiresIn: '1h' });

	res.status(200).json({ message: 'Login successful.', token });

app.get '/protected', do(req, res)
	const authHeader = req.headers.authorization;
	if not authHeader
		return res.status(401).json({ error: 'Authorization header missing.' });

	const token = (authHeader.split ' ')[1];
	try
		const decoded = jwt.verify(token, JWT_SECRET);
		(res.status 200).json({ message: `Welcome, ${decoded.username}!` });
	catch err
		(res.status 401).json { error: 'Invalid token.' }


const port = 64470

app.use(express.static('public'))

app.get '/' do(req, res)
	res.send index.body

imba.serve app.listen(port)


