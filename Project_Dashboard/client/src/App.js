import './App.css';
import UserForm from './Forms/userForm';
import 'bootstrap/dist/css/bootstrap.css';
import LockerForm from './Forms/lockerForm';
import UserTable from './Tables/userTable';
import LocationForm from './Forms/locationForm';
import LockerTable from './Tables/lockerTable';

function App() {
  return (
    <div className="App">
      <div className="row m-2">
        <div className="col border rounded m-2">
          <UserForm />
        </div>
        <div className="col border rounded m-2">
          <LockerForm />
        </div>
        <div className="col border rounded m-2">
          <LocationForm />
        </div>
      </div>
      <div>
        <UserTable />
        <LockerTable />
      </div>
    </div>
  );
}

export default App;
