import { useState } from 'react';
import 'bootstrap/dist/css/bootstrap.css';
import Axios from 'axios';

function UserForm() {
  const [userName, setUserName] = useState('');
  const [userEmail, setUserEmail] = useState('');
  const [userMobileNumber, setUserMobileNumber] = useState('');
  const [userPassword, setUserPassword] = useState('');

  const addUser = () => {
    Axios.post('http://localhost:3001/adduser', {
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
      <form>
        <p className="font-weight-bold text-left">ADD A NEW ADMIN USER</p>
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
          <button className="btn btn-primary" onClick={addUser}>
            Add User
          </button>
        </div>
      </form>
    </div>
  );
}
export default UserForm;
