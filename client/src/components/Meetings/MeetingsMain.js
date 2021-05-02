import React, { useEffect, useState } from 'react';
import MeetingsAction from '../Meetings/MeetingsAction';
import TabDataGrid from '../TabDataGrid'

const fetch = require('node-fetch');
const url = 'http://localhost:5000/Meetingss';

const MeetingsMain = () => {
    const [profs, setProfs] = useState([])
    const [firstName, setFirstName] = useState('')
    const [lastName, setLastName] = useState('')
    const [minNum, setMinNum] = useState('')
    const [maxNum, setMaxNum] = useState('')

    const [selected, setSelected] = useState('');

    const setters = { setFirstName, setLastName, setMinNum, setMaxNum };
    const values = { firstName, lastName, minNum, maxNum };

    const columns = [
        { field: 'meetings_id', headerName: 'ID', flex: 1 },
        { field: 'meetings_name', headerName: 'Meetings Name', flex: 1 },
        { field: 'meetings_description', headerName: 'Description', flex: 1 },
        { field: 'meeting_datetime', headerName: 'Date and Time', type: 'number', flex: 1},
        { field: 'meeting_duration', headerName: 'Duration', type: 'number', flex: 1 },
        { field: 'meeting_status_id', headerName: 'Status', type: 'number', flex: 1 },
        { field: 'meeting_room_id', headerName: 'Room ID', type: 'number', flex: 1 },
        { field: 'organizer_id', headerName: 'Organizer ID', type: 'number', flex: 1 },

    ];
 
    const addMeetings = async () => {
        await fetch('http://localhost:5000/Meetingss', {
            method: 'POST',
            body: JSON.stringify({
                "Meetings_name_first": firstName,
                "Meetings_name_last": lastName,
                "max_course_count": maxNum,
                "min_course_count": minNum
            }),
            headers: { 'Content-Type': 'application/json' }
        }).then(res => res.json()).then(json => console.log(json));
        await fetchMeetingss()
    }

    const deleteMeetings = async () => {
        await fetch('http://localhost:5000/Meetingss', {
            method: 'DELETE',
            body: JSON.stringify({
                "Meetings_id": selected.data.Meetings_id
            }),
            headers: { 'Content-Type': 'application/json' }
        })
        await fetchMeetingss()
    };

    const fetchMeetingss = async () => {
        let response = await fetch(url)
        response = await response.json()

        setProfs(response)
    };

    useEffect(() => {
        fetchMeetingss();
    }, []);

    return (
        <div style={{ margin: 'auto', minWidth: '75%' }}>
            <MeetingsAction addMeetings={addMeetings} deleteMeetings={deleteMeetings} selected={selected} setters={setters} values={values} />
            <TabDataGrid rows={profs} setSelected={setSelected} columns={columns} keyField={'Meetings_id'} />
        </div>
    );
}

export default MeetingsMain;
