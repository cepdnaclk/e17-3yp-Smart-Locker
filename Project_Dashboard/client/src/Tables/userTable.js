import { useState } from 'react';
import Axios from 'axios';
import * as ReactBootStrap from 'react-bootstrap';

function UserTable() {
  const [userList, setUserList] = useState([]);

  const getUser = () => {
    Axios.get('http://localhost:3001/senduser').then((response) => {
      //console.log(response);
      setUserList(response.data);
    });
  };
  getUser();
  const renderUser = (val, key) => {
    return (
      <tr key={key}>
        <td>{key}</td>
        <td>{val.UserName}</td>
        <td>{val.UserEmail}</td>
        <td>{val.MobileNumber}</td>
      </tr>
    );
  };
  return (
    <div>
      {/* <button className="btn btn-secondary" onClick={getUser}>
        Load Users
      </button> */}
      <div>
        <ReactBootStrap.Table className="table table-bordered mx-2 my-3">
          <thead>
            <tr>
              <th>#</th>
              <th>Name</th>
              <th>Mail</th>
              <th>Mobile</th>
            </tr>
          </thead>
          <tbody>{userList.map(renderUser)}</tbody>
        </ReactBootStrap.Table>
      </div>
    </div>
  );
}
export default UserTable;
