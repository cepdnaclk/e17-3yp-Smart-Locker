import { useState } from 'react';
import 'bootstrap/dist/css/bootstrap.css';
import Axios from 'axios';

import { ImUserPlus } from 'react-icons/im';

import '../Global/globalvariables';
import '../Styles/styles.css';
import Topbar from '../Components/Topbar';

function UserForm() {
  const [userName, setUserName] = useState('');
  const [userEmail, setUserEmail] = useState('');
  const [userMobileNumber, setUserMobileNumber] = useState('');
  const [userPassword, setUserPassword] = useState('');

  const addUser = () => {
    Axios.post(`${global.url}/api/admin/add`, {
      username: userName,
      useremail: userEmail,
      usermobilenumber: userMobileNumber,
      userpassword: userPassword,
    }).then(() => {
      console.log('Successfully added a User');
    });
  };
  return (
    <div>
      <Topbar />
      <div>
        <h3 className="top_margin">
          <ImUserPlus size={36} className="right_mar" />
          ADD A ADMIN USER
        </h3>
      </div>
      <div className="row">
        <div className="col"></div>
        <div className="col-7">
          <form className="border border-primary rounded p-2">
            <div className="form-group">
              <label>User Name: </label>
              <input
                className="form-control"
                type="text"
                onChange={(event) => {
                  setUserName(event.target.value);
                }}
              />
            </div>
            <div className="form-group">
              <label>User Email: </label>
              <input
                className="form-control"
                type="text"
                onChange={(event) => {
                  setUserEmail(event.target.value);
                }}
              />
            </div>
            <div className="form-group">
              <label>Mobile Number: </label>
              <input
                className="form-control"
                type="text"
                onChange={(event) => {
                  setUserMobileNumber(event.target.value);
                }}
              />
            </div>
            <div className="form-group">
              <label>Password: </label>
              <input
                className="form-control"
                type="text"
                onChange={(event) => {
                  setUserPassword(event.target.value);
                }}
              />
            </div>
            <div className="form-group py-1">
              <button
                className="btn btn-primary rounded-pill"
                onClick={addUser}
              >
                Add User
              </button>
            </div>
          </form>
        </div>
        <div className="col"></div>
      </div>
    </div>
  );
}
export default UserForm;
