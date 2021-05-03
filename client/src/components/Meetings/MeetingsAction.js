import React from 'react';
import Button from '@material-ui/core/Button';
import TextField from '@material-ui/core/TextField';
import TabActionForm from '../TabActionForm'


const MeetingsAction = (props) => {
    const { addMeetings, deleteMeetings, selected, values, setters } = props;
    const { setFirstName, setLastName, setMinNum, setMaxNum } = setters;
    const { firstName, lastName, minNum, maxNum } = values;

    const textFields = (
        [
            <TextField
                label="Meeting Name"
                fullWidth
                onChange={e => setFirstName(e.target.value)}
                margin="normal"
            />,
            <TextField
                label="Meeting Description"
                fullWidth
                onChange={e => setLastName(e.target.value)}
                margin="normal"
            />,
            <TextField
                label="Date and Time"
                fullWidth
                onChange={e => setMinNum(e.target.value)}
                margin="normal"
                type="number"
            />,
            <TextField
                label="Duration"
                fullWidth
                onChange={e => setMaxNum(e.target.value)}
                margin="normal"
                type="number"
            />,
            <TextField
            label="Status ID"
            fullWidth
            onChange={e => setMaxNum(e.target.value)}
            margin="normal"
            type="number"
             />,
            <TextField
                label="Room ID"
                fullWidth
                onChange={e => setMaxNum(e.target.value)}
                margin="normal"
                type="number"
            />,
            <TextField
            label="Org ID"
            fullWidth
            onChange={e => setMaxNum(e.target.value)}
            margin="normal"
            type="number"
            />
        ]
    )

    const addButton =
        <Button type="back" variant="outlined" onClick={addMeetings} disabled={!(firstName && lastName && maxNum && minNum)}>
            Add Meetings
        </Button>

    const deleteButton =
        <Button type="submit" variant="outlined" onClick={deleteMeetings} disabled={!selected}>
            Delete Meetings
        </Button>

    return (
        <TabActionForm textFields={textFields} addButton={addButton} deleteButton={deleteButton} />
    );
}

export default MeetingsAction
