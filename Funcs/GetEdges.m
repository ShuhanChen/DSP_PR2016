function edges = GetEdges( spnum, adjloop )

    edges = [];
    for i=1:spnum
        indext=[];
        ind=find(adjloop(i,:)>0);
        for j=1:length(ind)
            indj=find(adjloop(ind(j),:)>0);
            indext=[indext,indj];
        end
        indext=[indext,ind];
        indext=indext((indext>i));
        indext=unique(indext);
        if(~isempty(indext))
            ed=ones(length(indext),2);
            ed(:,2)=i*ed(:,2);
            ed(:,1)=indext;
            edges=[edges;ed];
        end
    end
end

