//import App from '../App';
import React from 'react';
import { useState } from 'react';
import { Link } from 'react-router-dom';
import { MdOutlineLogin } from 'react-icons/md';

import 'bootstrap/dist/css/bootstrap.css';
import '../App.css';
import '../Styles/styles.css';

import LogInTopbar from '../Components/LogInTopbar';

function Login() {
  const [name, setName] = useState('');
  const [password, setPassword] = useState('');
  return (
    <div>
      <LogInTopbar />
      <div>
        <h3 class="top_margin">
          <MdOutlineLogin size={36} className="right_mar" />
          LOGIN
        </h3>
      </div>
      <div className="App">
        <div className="row">
          <div className="col"></div>
          <div className="col-7">
            <form className="border border-primary rounded p-2">
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
                <Link to="/home">
                  <button className="btn btn-primary">LOG IN</button>
                </Link>
              </div>
            </form>
          </div>
          <div className="col"></div>
        </div>
      </div>
    </div>
  );
}
export default Login;
