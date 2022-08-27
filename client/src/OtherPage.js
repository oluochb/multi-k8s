import React from 'react';
import {Link } from 'react-router-dom';

const otherPage = () => {
    return (
        <div>
            In some other page!
            <Link to="/">Go back home</Link>
        </div>
    );
};

export default otherPage;