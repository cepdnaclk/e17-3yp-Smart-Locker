import { useState } from 'react';
import Axios from 'axios';

function UserTable() {
  const [userList, setUserList] = useState([]);

  const getUser = () => {
    Axios.get('http://localhost:3001/senduser').then((response) => {
      console.log(response);
      setUserList(response.data);
    });
  };
  return (
    <div>
      <button className="btn btn-secondary" onClick={getUser}>
        Load Users
      </button>
      {userList.map((val, key) => {
        return (
          <div>
            <table className="table table-bordered mx-2 my-3">
              <thead>
                <tr>
                  <th scope="col">#</th>
                  <th scope="col">Name</th>
                  <th scope="col">Mail</th>
                  <th scope="col">Mobile</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <th scope="row">1</th>
                  <td>{val.UserName}</td>
                  <td>{val.UserEmail}</td>
                  <td>{val.MobileNumber}</td>
                </tr>
              </tbody>
            </table>
          </div>
        );
      })}
    </div>
  );
}
export default UserTable;
