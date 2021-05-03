import React from 'react';
import Tabs from '@material-ui/core/Tabs';
import Tab from '@material-ui/core/Tab';
import Box from '@material-ui/core/Box';
import MeetingsMain from './Meetings/MeetingsMain';


function Panel(props) {
  const { children, value, index } = props;

  return (
    <div>
      {value === index && (
        <Box p={3} style={{ alignContent: 'center', margin: 'auto' }}>
          {children}
        </Box>
      )}
    </div>
  );
}

const Home = () => {
  const [value, setValue] = React.useState(0);

  const handleChange = (event, newValue) => {
    setValue(newValue);
  };

  return (
    <div style={{width: '100%' }}>
      <Tabs
        value={value}
        onChange={handleChange}
        showLabels
      >
        <Tab label="Meeting" />
      </Tabs>
      <Panel value={value} index={0}>
        <MeetingsMain/>
      </Panel>

      </div>
  )
};

export default Home;