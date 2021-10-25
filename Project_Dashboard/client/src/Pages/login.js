//import App from '../App';
import React from 'react';
import { useState } from 'react';
import 'bootstrap/dist/css/bootstrap.css';
import App from '../App';
import '../App.css';

function Login() {
  const [name, setName] = useState('');
  const [password, setPassword] = useState('');
  return (
    <div className="App">
      <div className="col border rounded m-2">
        <form>
          <p>LOG IN</p>
          <div className="form-group">
            <label>Name</label>
            <input
              className="form-control"
              type="text"
              onChange={(event) => {
                setName(event.target.value);
              }}
            />
          </div>
          <div className="form-group">
            <label>Password </label>
            <input
              className="form-control"
              type="text"
              onChange={(event) => {
                setPassword(event.target.value);
              }}
            />
          </div>

          <div className="form-group py-1">
            <button className="btn btn-primary">LOG IN</button>
          </div>
        </form>
      </div>
    </div>
  );
}
export default Login;
