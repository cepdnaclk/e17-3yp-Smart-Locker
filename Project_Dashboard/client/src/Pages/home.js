import React from 'react';
import '../Styles/styles.css';
import Topbar from '../Components/Topbar';

function Home() {
  return (
    <div>
      <div>
        <Topbar />
      </div>
      <div className="row">
        <div className="col">
          <img
            className="logo1"
            src={process.env.PUBLIC_URL + 'logo.png'}
          ></img>
        </div>
        <div>
          <h2 class="font1">Welcome to the Smart Locker Admin Dashboard</h2>
        </div>

        <div>
          <h3 className="font1">Here You will be able to</h3>

          <h4 class="font1">
            Add new admin users <br />
            Delete any User
            <br />
            Add and delete Lockers
            <br />
            Add and delete Locker Location
          </h4>
        </div>
      </div>
    </div>
  );
}
export default Home;
