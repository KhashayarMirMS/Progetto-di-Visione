function result = fit(bigger, smaller, tform, paddings)
    tmp = ones(size(smaller, 1), size(smaller, 2));
    tmp = imtransform(tmp, tform); %#ok
    tmp = padarray(tmp, [paddings(1, 1), paddings(2, 1)], 'pre');
    tmp = padarray(tmp, [paddings(1, 2), paddings(2, 2)], 'post');
    
    biggerR = bigger(:, :, 1);
    biggerG = bigger(:, :, 2);
    biggerB = bigger(:, :, 3);
    
    biggerR(tmp~=0) = 0;
    biggerG(tmp~=0) = 0;
    biggerB(tmp~=0) = 0;
    bigger = cat(3, biggerR, biggerG, biggerB);

    transformed = imtransform(smaller, tform); %#ok
    transformed = padarray(transformed, [paddings(1, 1), paddings(2, 1)], 'pre');
    transformed = padarray(transformed, [paddings(1, 2), paddings(2, 2)], 'post');

    result = bigger + transformed;
end