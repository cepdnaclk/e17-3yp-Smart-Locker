import './App.css';
import { Route, Link } from 'react-router-dom';
import 'bootstrap/dist/css/bootstrap.css';

import UserForm from './Forms/userForm';
import LockerForm from './Forms/lockerForm';
import UserTable from './Tables/userTable';
import LocationForm from './Forms/locationForm';
import LockerTable from './Tables/lockerTable';
import LocationTable from './Tables/locationTable';
import Topbar from './Components/Topbar';
import Home from './Pages/home';

function App() {
  return (
    <div className="App">
      <div>
        <div>
          <Topbar />
        </div>
        <div>
          <Route exact path="/" component={Home} />
          <Route exact path="/users" component={UserTable} />
          <Route exact path="/locations" component={LocationTable} />
          <Route exact path="/lockers" component={LockerTable} />
          <Route exact path="/newuser" component={UserForm} />
          <Route exact path="/newlocation" component={LocationForm} />
          <Route exact path="/newlocker" component={LockerForm} />
        </div>
        {/* <Topbar />
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
        <LocationTable />
      </div> */}
      </div>
    </div>
  );
}

export default App;
